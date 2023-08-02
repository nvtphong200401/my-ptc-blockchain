FROM node

RUN mkdir /ptc
ADD package.json /ptc/
RUN cd /ptc && npm install

ADD tsconfig.json /ptc/
ADD tslint.json /ptc/
ADD src /ptc/src
ADD node /ptc/node


EXPOSE 3001
EXPOSE 6001

ENTRYPOINT cd /ptc && npm install && PEERS=$PEERS npm start
