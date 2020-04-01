const path = require("path");

module.exports = {
  entry: "./src/dust-chart/index.js",
  output: {
    path: path.resolve(__dirname, "dist/"),
    filename: "dust_bundle.js"
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: ["style-loader", "css-loader"]
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-env"]
          }
        }
      },
      {
        test: /\.(png|jpe?g|gif)$/i,
        loader: "file-loader",
        options: {
          outputPath: "assets"
        }
      }
    ]
  }
};
