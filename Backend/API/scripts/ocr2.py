import cv2
import os, argparse
import pytesseract
from PIL import Image
import docx
import aspose.words as aw


def image_to_text(path):

    images = cv2.imread(path)

    gray = cv2.cvtColor(images, cv2.COLOR_BGR2GRAY)

    filename = "{}.png".format(os.getpid())
    cv2.imwrite(filename, gray)
    text = pytesseract.image_to_string(Image.open(filename))
    os.remove(filename)

    finaltext = "".join(c for c in text if valid_xml_char_ordinal(c))
    mydoc = docx.Document()

    mydoc.add_paragraph(finaltext)
    mydoc.save("../../Frontend/documents/MyFile.docx")
    return text

    cv2.waitKey(0)


def valid_xml_char_ordinal(c):
    codepoint = ord(c)

    return (
        0x20 <= codepoint <= 0xD7FF
        or codepoint in (0x9, 0xA, 0xD)
        or 0xE000 <= codepoint <= 0xFFFD
        or 0x10000 <= codepoint <= 0x10FFFF
    )
