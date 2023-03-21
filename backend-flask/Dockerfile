FROM python:3.10-slim-buster AS builder

WORKDIR /backend-flask

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc

COPY requirements.txt .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir ./wheels -r requirements.txt

FROM ubuntu:20.04 AS final

# Create non-root user
ARG USERNAME=docker
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# Copy dependencies from builder
COPY --from=builder /backend-flask/wheels /wheels
COPY --from=builder /backend-flask/requirements.txt .
# install python and python dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache /wheels/*

# Copy backend app files
WORKDIR /backend-flask
COPY . .

ENV FLASK_ENV=development
EXPOSE ${PORT}

USER ${USERNAME}
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4567"]
