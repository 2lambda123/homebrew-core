class Gdl < Formula
  desc "GNOME Docking Library provides docking features for GTK+ 3"
  homepage "https://gitlab.gnome.org/GNOME/gdl"
  url "https://download.gnome.org/sources/gdl/3.40/gdl-3.40.0.tar.xz"
  sha256 "3641d4fd669d1e1818aeff3cf9ffb7887fc5c367850b78c28c775eba4ab6a555"
  license "LGPL-2.0-or-later"

  bottle do
    sha256                               arm64_sonoma:   "6afb4a5408293dbf345d97596a338dfe52947e942cb94358cf549b3002c7e138"
    sha256                               arm64_ventura:  "05d8c74345f6a707a3a7f106b224457683c9f98da930d58a76ed60aee42596d8"
    sha256                               arm64_monterey: "20a0742ffcaa3bf6a8ee5c1531ed48f2b51a18c7a816f4b96d85192c2906db23"
    sha256                               arm64_big_sur:  "e96c5e69fc084fd421f08f651e8727fb7a5d28e270c804ebba7e6d860ccec583"
    sha256                               sonoma:         "8cddff42604e103f61dfc97365f40fb04e306f29e014fdc3d06aedf29d4b1196"
    sha256                               ventura:        "83bb5806dac6659eb548241dcdc75b241ba8f75f8591fcec7af37c5b0e7a3c02"
    sha256                               monterey:       "b1a120f5c6ae1e9f6802be4306f00cc2fc54ca1aaf75c017fa74efd6dec2da0e"
    sha256                               big_sur:        "98cb1563adec26dea9289d5ad3f5b006c26897cc9c586114efe0dcc2214a1a68"
    sha256                               catalina:       "11df5d907431165eb6f9a6b8673f413dfd939199940b5a2e3a3f78eab11c2ce8"
    sha256                               mojave:         "7d91a82fb426e6791aea2e93a9d0fdbf33aa8fb366d375734001614196212564"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "26ae14bf457ab681be21fe8b61fa612af211f80c2d8f52416dbb4a9f55eaa0e7"
  end

  depends_on "gettext" => :build
  depends_on "gobject-introspection" => :build
  depends_on "intltool" => :build
  depends_on "pkg-config" => :build
  depends_on "gtk+3"
  depends_on "libxml2"

  uses_from_macos "perl" => :build

  on_linux do
    depends_on "perl-xml-parser" => :build
  end

  def install
    if OS.linux?
      ENV.prepend_path "PERL5LIB", Formula["perl-xml-parser"].libexec/"lib/perl5"
      ENV["INTLTOOL_PERL"] = Formula["perl"].bin/"perl"
    end

    system "./configure", *std_configure_args,
                          "--disable-silent-rules",
                          "--enable-introspection=yes"
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <gdl/gdl.h>

      int main(int argc, char *argv[]) {
        GType type = gdl_dock_object_get_type();
        return 0;
      }
    EOS
    ENV.libxml2
    atk = Formula["atk"]
    cairo = Formula["cairo"]
    fontconfig = Formula["fontconfig"]
    freetype = Formula["freetype"]
    gdk_pixbuf = Formula["gdk-pixbuf"]
    gettext = Formula["gettext"]
    glib = Formula["glib"]
    gtkx3 = Formula["gtk+3"]
    harfbuzz = Formula["harfbuzz"]
    libepoxy = Formula["libepoxy"]
    libpng = Formula["libpng"]
    pango = Formula["pango"]
    pixman = Formula["pixman"]
    flags = %W[
      -I#{atk.opt_include}/atk-1.0
      -I#{cairo.opt_include}/cairo
      -I#{fontconfig.opt_include}
      -I#{freetype.opt_include}/freetype2
      -I#{gdk_pixbuf.opt_include}/gdk-pixbuf-2.0
      -I#{gettext.opt_include}
      -I#{glib.opt_include}/gio-unix-2.0/
      -I#{glib.opt_include}/glib-2.0
      -I#{glib.opt_lib}/glib-2.0/include
      -I#{gtkx3.opt_include}/gtk-3.0
      -I#{harfbuzz.opt_include}/harfbuzz
      -I#{include}/libgdl-3.0
      -I#{libepoxy.opt_include}
      -I#{libpng.opt_include}/libpng16
      -I#{pango.opt_include}/pango-1.0
      -I#{pixman.opt_include}/pixman-1
      -D_REENTRANT
      -L#{atk.opt_lib}
      -L#{cairo.opt_lib}
      -L#{gdk_pixbuf.opt_lib}
      -L#{gettext.opt_lib}
      -L#{glib.opt_lib}
      -L#{gtkx3.opt_lib}
      -L#{lib}
      -L#{pango.opt_lib}
      -latk-1.0
      -lcairo
      -lcairo-gobject
      -lgdk-3
      -lgdk_pixbuf-2.0
      -lgdl-3
      -lgio-2.0
      -lglib-2.0
      -lgobject-2.0
      -lgtk-3
      -lpango-1.0
      -lpangocairo-1.0
    ]
    flags << "-lintl" if OS.mac?
    system ENV.cc, "test.c", "-o", "test", *flags
    system "./test"
  end
end
