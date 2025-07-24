# PDF Compressor

A simple and efficient PDF compression utility for macOS that uses Ghostscript to reduce PDF file sizes while maintaining quality.

## Features

- **Multiple Quality Settings**: Choose from screen, ebook, printer, prepress, or default compression levels
- **Flexible Output**: Specify custom output filenames or use automatic naming with `_min` suffix
- **Size Reporting**: Shows original and compressed file sizes after compression
- **Simple CLI Interface**: Easy-to-use command line tool

## Requirements

- macOS
- Ghostscript

### Installing Ghostscript

```bash
brew install ghostscript
```

## Installation

1. Clone or download this repository
2. Make the script executable:
   ```bash
   chmod +x compress_pdf.sh
   ```

## Usage

```bash
./compress_pdf.sh input.pdf [quality] [output.pdf]
```

### Arguments

- `input.pdf` - Path to the source PDF file (required)
- `quality` - Compression quality level (optional, defaults to "ebook")
- `output.pdf` - Custom name for the compressed file (optional, defaults to `filename_min.pdf`)

### Quality Settings

| Quality | Description | Use Case |
|---------|-------------|----------|
| `screen` | Lowest quality, smallest file size | Web viewing, email attachments |
| `ebook` | Good balance of quality and size (default) | General purpose, digital reading |
| `printer` | High quality, suitable for printing | Desktop printing |
| `prepress` | Highest quality, largest file size | Professional printing |
| `default` | Ghostscript default settings | Balanced compression |

## Examples

### Basic compression (using default "ebook" quality)
```bash
./compress_pdf.sh "My Document.pdf"
# Output: My Document_min.pdf
```

### Compress with specific quality setting
```bash
./compress_pdf.sh "Large File.pdf" screen
# Output: Large File_min.pdf (heavily compressed)
```

### Compress with custom output filename
```bash
./compress_pdf.sh "Original.pdf" ebook "Compressed.pdf"
# Output: Compressed.pdf
```

### Maximum compression for web use
```bash
./compress_pdf.sh "Plans.pdf" screen "Plans_small.pdf"
```

## Sample Results

The repository includes examples of compressed files:
- Original PDFs are compressed using the utility
- Files with `_min` suffix show the compression results
- Typical compression ratios range from 50-90% size reduction

## License

This project is open source. Feel free to use, modify, and distribute.

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for improvements. 