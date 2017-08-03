int cnt=25; //the number of boxes in a row and a column
int x, y, w=500/cnt, h=500/cnt; //box info
int num=1;
int[] check=new int[cnt*cnt+1]; 

void setup(){
  size(500,500);
  stroke(0);
  textSize(8);
  textAlign(CENTER, CENTER);
  for (int i = 0; i < check.length; i++) {
    check[i] = 0;
  }
}
void draw(){
  for(y=0; y<=500-w; y+=h){
    for(x=0; x<=500-h; x+=w){
      if(check[num]==0 && isPrime(num)){
        fill(200);
      }else{
        fill(100);
      }
      rect(x,y,w,h);
      fill(0);
      text(num++, x+w/2, y+h/2);
    }
  }
  noLoop(); 
}

boolean isPrime(int n){
 //modify below code
 if(n==1) return false;
 else
	return true;
}