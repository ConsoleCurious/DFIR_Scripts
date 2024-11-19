import os
import pandas as pd
import extract_msg

# Define the directory containing the .msg files
directory = r'your\directory'

# List to store email headers as dictionaries
email_headers = []

# Recursively iterate through each file in the directory and its subdirectories
for root, _, files in os.walk(directory):
    for filename in files:
        if filename.endswith('.msg'):
            file_path = os.path.join(root, filename)
            msg = extract_msg.Message(file_path)
            headers = {key: value for key, value in msg.header.items()}
            headers['file_name'] = filename
            headers['file_path'] = file_path
            email_headers.append(headers)

# Convert the list of dictionaries to a DataFrame
df = pd.DataFrame(email_headers)

# Output the DataFrame to a CSV file
output_csv = os.path.join(directory, 'email_headers.csv')
df.to_csv(output_csv, index=False)
