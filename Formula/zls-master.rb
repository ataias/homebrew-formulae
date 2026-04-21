class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.10+1ebcc794"
  license "MIT"
  # zls_commit: 1ebcc79429
  # zig_version: 0.17.0-dev.56+a8226cd53

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "3c6dc8b6bf61626f80fc84017cf799946742940ffe6765c0f19a546faf7cb952"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "3763f1630f9cf5194c3e15b0d36984afc62b34b562180ad65b5a944e62dd96af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "66a28ede9a9fc9d2026eb413192050d345b90540932bddf8bb1eac2888f763c5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "02ef9ce0565527815534e04a10575f4ebcb451b7a6c37449f32a0b335ddbad93"
    end
  end

  conflicts_with "zls", because: "both install a `zls` binary"

  def install
    bin.install "zls"
  end

  test do
    system bin/"zls", "--version"
  end
end
