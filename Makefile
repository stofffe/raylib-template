default:
	make debug_run

debug_build:
	mkdir -p build/debug
	cmake -DCMAKE_BUILD_TYPE=Debug -S . -B ./build/debug
	cmake --build ./build/debug

debug_run: debug_build
	./build/debug/RaylibTemplate

release_build:
	mkdir -p build/release
	cmake -DCMAKE_BUILD_TYPE=Release -S . -B ./build/release
	cmake --build ./build/release

release_run: release_build
	./build/release/RaylibTemplate

clean:
	rm -rf ./build
