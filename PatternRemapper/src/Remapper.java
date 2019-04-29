import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Remapper {

    public static void main(String[] args) {
        try {
            new Remapper().remap(args[0], args[1]);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Remap the TCHARS in toFileName to use the same patterns as in fromFileName7
    // Write the output to output.a99
    private void remap(String toFileName, String fromFileName) throws IOException {
        List<String> toLines = readTextFile(toFileName);
        List<String> fromLines = readTextFile(fromFileName);
        boolean remapping = false;
        for (int i = 0; i < toLines.size(); i++) {
            String line = toLines.get(i);
            if (!remapping && line.startsWith("TCHARS")) {
                remapping = true;
            }
            if (remapping && line.startsWith("*")) {
                remapping = false;
            }
            if (remapping) {
                remapLine(i, toLines, fromLines);
            }
        }
        writeTextFile("output.a99", toLines);
    }

    private void remapLine(int index, List<String> toLines, List<String> fromLines) {
        String line = toLines.get(index);
        int bytePos = line.indexOf("BYTE");
        if (bytePos != -1) {
            int fromCharIndex = hexByteValue(line.substring(bytePos + 5, bytePos + 8));
            int fromCharNewIndex = remapChar(fromCharIndex, toLines, fromLines);
            int toCharIndex = hexByteValue(line.substring(bytePos + 9, bytePos + 12));
            int toCharNewIndex = remapChar(toCharIndex, toLines, fromLines);
            if (fromCharNewIndex != -1 && toCharNewIndex != -1) {
                String remappedLine =
                    line.substring(0, bytePos + 5) +
                    hexByteValue(fromCharNewIndex) + "," + hexByteValue(toCharNewIndex) +
                    line.substring(bytePos + 12);
                toLines.set(index, remappedLine);
            }
        }
    }

    private int remapChar(int charIndex, List<String> toLines, List<String> fromLines) {
        int remappedIndex = -1;
        if (charIndex != 255) {
            String patternData = getPatternData(charIndex, toLines);
            if (patternData != null) {
                remappedIndex = getPatternIndex(patternData, fromLines);
            }
        }
        return remappedIndex;
    }

    private String hexByteValue(int hexByte) {
        String s = Integer.toHexString(hexByte).toUpperCase();
        if (s.length() < 2) {
            s = "0" + s;
        }
        return ">" + s;
    }

    private int hexByteValue(String hexByteString) {
        return Integer.parseInt(hexByteString.substring(1), 16);
    }

    private String getPatternData(int patternIndex, List<String> lines) {
        for (String line : lines) {
            if (line.startsWith("PAT" + patternIndex)) {
                return getPatternData(line);
            }
        }
        return null;
    }

    private int getPatternIndex(String patternData, List<String> lines) {
        for (String line : lines) {
            if (line.startsWith("PAT")) {
                if (patternData.equals(getPatternData(line))) {
                    return Integer.parseInt(line.substring(3, 5).trim());
                }
            }
        }
        return -1;
    }

    private String getPatternData(String line) {
        return line.substring(13, 36);
    }

    private List<String> readTextFile(String fileName) throws IOException {
        List<String> lines = new ArrayList<>();
        FileReader fileReader = new FileReader(fileName);
        BufferedReader bufferedReader = new BufferedReader(fileReader);
        String line = bufferedReader.readLine();
        while (line != null) {
            lines.add(line);
            line = bufferedReader.readLine();
        }
        fileReader.close();
        return lines;
    }

    private void writeTextFile(String fileName, List<String> lines) throws IOException {
        FileWriter fileWriter = new FileWriter(fileName);
        BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
        for (String line : lines) {
            bufferedWriter.write(line);
            bufferedWriter.newLine();
        }
        fileWriter.close();
    }
}
