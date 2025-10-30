if ! is_installed npm; then
  curl -L https://www.npmjs.com/install.sh | sh
fi
print_package_version npm

npm install -g yarn
npm install -g typescript
npm install -g typescript typescript-language-server
