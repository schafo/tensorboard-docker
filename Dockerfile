FROM python:3.8.0-slim

RUN pip install --upgrade pip
RUN pip install tensorboard==2.*

# Warning in logs is fine: https://github.com/lanpa/tensorboardX/issues/602#issuecomment-693246519
CMD tensorboard --logdir=runs --host 0.0.0.0 --port 6006
