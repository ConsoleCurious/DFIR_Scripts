# Step 1: Install the necessary libraries
# pip install pillow pyzbar

from PIL import Image
from pyzbar.pyzbar import decode
import os

# Step 2: Read the image containing the QR code
def read_qr_code(image_path):
    image = Image.open(image_path)

    # Step 3: Use pyzbar to detect and decode the QR code
    qr_codes = decode(image)

    # Step 4: Extract the data from the QR code and write it to a file
    output_file = os.path.join(os.path.dirname(image_path), 'output.txt')
    with open(output_file, 'w') as file:
        for qr_code in qr_codes:
            qr_data = qr_code.data.decode('utf-8')
            file.write(f"QR Code Data: {qr_data}\n")

# Example usage
read_qr_code(r'your\file\path\qr_code.png')
