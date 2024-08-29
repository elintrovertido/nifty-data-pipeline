import os
import boto3
import dotenv

dotenv.load_dotenv()

BUCKET_NAME = os.getenv('BUCKET_NAME')
LOCAL_DIR = 'E:/PROJECTS/NiftyFifty/assets'


# print(os.getenv('AWS_ACCESS_KEY_ID'))
# print(os.getenv('AWS_SECRET_ACCESS_KEY'))
# print(os.getenv('AWS_DEFAULT_REGION'))
# print(os.getenv('BUCKET_NAME'))

s3_client = boto3.client(
    's3',
    aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),
    aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'),
    region_name=os.getenv('AWS_DEFAULT_REGION')
)


def upload_csv_files_into_s3(local_dir, bucket_name):
    files = os.listdir(path=local_dir)
    for file in files:
        if file.endswith('.csv'):
            local_file_path = os.path.join(LOCAL_DIR, file)
            s3_key = f'NiftyStocks/{file}'
            try:
                s3_client.upload_file(
                    Filename = local_file_path,
                    Bucket = bucket_name,
                    Key = s3_key
                )  
            except Exception as e:
                print(e)

if __name__ == "__main__":
    upload_csv_files_into_s3(LOCAL_DIR, BUCKET_NAME)




