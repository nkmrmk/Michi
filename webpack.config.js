const path = require('path');
module.exports = {
  entry: './src/index.js', // エントリーポイント
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist'), // 出力ディレクトリ
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env'],
            plugins: ['@babel/plugin-proposal-private-methods']
          }
        }
      }
    ]
  },
  devServer: {
    contentBase: path.join(__dirname, 'dist'),
    compress: true,
    port: 9000
  }
};






