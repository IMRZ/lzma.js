cd lzip

#make clean
#make lzip -j 2 # native build
#mv lzip ../lzma-native

make clean
~/Dev/emscripten/emmake make lzip -j 2 # bitcode build
mv lzip lzip.bc
 
cd ..

~/Dev/emscripten/emcc -O1 --closure 0 lzip/lzip.bc -o lzma.raw.js
cat pre.js > lzma.js
cat lzma.raw.js >> lzma.js
cat post.js >> lzma.js
