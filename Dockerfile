#build phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

#run phase
FROM nginx
#EBS is going to look at this EXPOSE instruction and use that as the port that gets mapped for incoming traffic.
#EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html