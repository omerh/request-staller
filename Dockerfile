FROM public.ecr.aws/docker/library/python:slim

WORKDIR /app
COPY . /app

RUN pip3 install -r requirements.txt
RUN opentelemetry-bootstrap --action=install

ENV OTEL_PYTHON_DISABLED_INSTRUMENTATIONS=urllib3
ENV OTEL_RESOURCE_ATTRIBUTES='service.name=request-staller'

EXPOSE 8080

CMD OTEL_PROPAGATORS=xray OTEL_PYTHON_ID_GENERATOR=xray opentelemetry-instrument python3 app.py
