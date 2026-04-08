class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3132+fd2718f82"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3132+fd2718f82.tar.xz"
      sha256 "b62693498904c03ecc72beaf97eb1f0e5c6a26ee7e7e7c7b82d586ed8a7158be"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3132+fd2718f82.tar.xz"
      sha256 "2cf579826b564ac76fe54975c402b34d75e1583bcd04f14fcad675e780bff917"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3132+fd2718f82.tar.xz"
      sha256 "1b5f45cdc41ce596f8942589391c25a39c319aff07bc5bdc9bc7d1eb740d66ea"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3132+fd2718f82.tar.xz"
      sha256 "4c30afe5ff1f1945db556b23418d8a4526e3a636496884e2979b39fe11bdfc32"
    end
  end

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install Dir["lib/*"]
  end

  test do
    system bin/"zig", "init"
    system bin/"zig", "build", "--summary", "all"
    system bin/"zig", "build", "run"
    system bin/"zig", "build", "test", "--summary", "all"
  end
end
