module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/components/**/*.erb',
    './app/components/**/*.rb',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  plugins: [
    require("daisyui")
  ]
}
