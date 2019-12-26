#! /usr/bin/gawk -f


BEGIN{
  FS="\\input{|}"
}{
  regex="(%*)(.*)\\input{(.*)}";
  if(match($0,regex,a)){
    file = a[3];
    if(a[1]==""){
      match(file,".tex",b);
      if(RLENGTH<0){
          system("./recursivelyMergeTex.awk "file".tex");
      }
      else{
          system("./recursivelyMergeTex.awk "file);
      }
    }

  }
  else{
    print $0
  }
}
