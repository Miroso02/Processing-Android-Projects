class Neuron
{
  int weightsN;
  float[] weights;
  
  Neuron(int wN)
  {
    weights=new float[weightsN];
    for(float w:weights)
      w=random(-100,100);
  }
  
  float countValue(float[] input)
  {
    float value=0;
    for(int i=0;i<weightsN;i++)
    {
      value+=weights[i]*input[i];
    }
    return value;
  }
  
  void newWeights(Neuron n)
  {
    float[] genes=n.weights;
    for (int i=0; i<weights.length; i++)
      {
        //we change his weights according to
        //the best ones
        
        int t=(int)random(20)+1;
        switch(t)
        {
        case 1: 
          weights[i]=genes[i]+4; 
          break;
        case 2: 
          weights[i]=genes[i]-4; 
          break;
        case 3: 
          weights[i]=genes[i]*1.1; 
          break;
        case 4: 
          weights[i]=genes[i]/1.1; 
          break;
        case 5: 
          weights[i]=genes[i]+10; 
          break;
        case 6: 
          weights[i]=genes[i]-10; 
          break;
        case 7: 
          weights[i]=genes[i]*1.3; 
          break;
        case 8: 
          weights[i]=genes[i]/1.3; 
          break;
        case 9: 
          weights[i]=-genes[i]; 
          break;
        case 10:
        case 11:
          weights[i]=random(-100,100);
          break;
        default: //45% chance not to change parameter
          weights[i]=genes[i]; 
        }
      }
  }
}