FROM node:16.19 AS builder

WORKDIR /frontend-react-js
COPY package.json .
# configure npm
RUN npm set progress=false && npm config set depth 0
#install only production node modules
RUN npm install --only=production
# copy production node_modules aside
RUN cp -R node_modules prod_node_modules
# install ALL node_modules, including 'devDependencies'
RUN npm install

# build final image
FROM node:16.19-bullseye-slim AS final
# copy dependecies
COPY --from=builder /frontend-react-js/node_modules ./node_modules
WORKDIR /frontend-react-js

ENV PORT=3000
EXPOSE ${PORT}
CMD ["npm", "start"]
