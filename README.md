##

 echo ">=sys-devel/llvmgold-19" >> /etc/portage/package.mask/all
 
cat /etc/portage/package.mask/all 
>=sys-devel/llvmgold-19
its pulling llvm-19 while other things use llvm_slot=18 at max

#for getting gpg signature for binary pkg
getuto

intel iris driver needs dev-libs/libclc  which needss llvm and clang
  emerge -v --getbinpkgonly -a sys-devel/llvm or  llvm-gold
  emerge -v --getbinpkgonly -a  sys-devel/clang

  #to avoid rust only this pkg need russt for now
  emerge -v --getbinpkgonly -a gnome-base/librsvg

  
