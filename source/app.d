import std.stdio;
import imageformats;
import mir.ndslice;

void main()
{
	auto image = read_image("data/d-man.png");
	writefln!"width: %d, height: %d, color: %s"(image.w, image.h, image.c);

	auto s = image.pixels.sliced(image.w, image.h, 4).transposed!(2, 0, 1);

	auto r = new ubyte[image.pixels.length];
	auto image_r = r.sliced(image.w, image.h, 4).transposed!(2, 0, 1);
	// original
	image_r[0][] = s[0][];
	image_r[1][] = s[1][];
	image_r[2][] = s[2][];
	image_r[3][] = s[3][];
	write_image("data/d-man_r.png", image.w, image.h, r, ColFmt.RGBA);
	
	auto g = new ubyte[image.pixels.length];
	auto image_g = g.sliced(image.w, image.h, 4).transposed!(2, 0, 1);
	// swap R and G
	image_g[0][] = s[1][];
	image_g[1][] = s[0][];
	image_g[2][] = s[2][];
	image_g[3][] = s[3][];
	write_image("data/d-man_g.png", image.w, image.h, g, ColFmt.RGBA);
	
	auto b = new ubyte[image.pixels.length];
	auto image_b = b.sliced(image.w, image.h, 4).transposed!(2, 0, 1);
	// swap R and B
	image_b[0][] = s[2][];
	image_b[1][] = s[1][];
	image_b[2][] = s[0][];
	image_b[3][] = s[3][];
	write_image("data/d-man_b.png", image.w, image.h, b, ColFmt.RGBA);
}
