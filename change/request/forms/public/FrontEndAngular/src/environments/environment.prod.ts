export const environment = {
  // baseURL: 'http://localhost:8000/',
  // //baseURL: 'http://41.59.90.211:8000/',
  // leaderImgURL: 'http://localhost:4200/assets/images/leaders/',
  //production: false,

  baseURL: window["env"]["baseURL"] || "default",
  production: window["env"]["production"] || "default"
};
