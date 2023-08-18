FROM python:3.9
WORKDIR /ImgHog
COPY ./requirements.txt /ImgHog/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /ImgHog/requirements.txt

COPY ./app /ImgHog/app

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 -y

ENV PYTHONPATH="${PYTHONPATH}:/ImgHog"

CMD [ "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
