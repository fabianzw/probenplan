FROM python:3-alpine

RUN mkdir /code
WORKDIR /code
COPY . /code/
RUN apk add build-base \
    && pip install -r requirements.txt \
    && mkdir static \
    && python manage.py migrate \
    && python manage.py compilescss \
    && python manage.py collectstatic

ENV PYTHONUNBUFFERED 1
ENV PROBENPLAN_CALENDAR "none"

EXPOSE 8000

CMD python manage.py runserver 0.0.0.0:8000
