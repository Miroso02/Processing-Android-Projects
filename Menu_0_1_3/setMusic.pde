void setMusic()
{
  try
  {
    AssetFileDescriptor file1=getAssets().openFd("Unknown_This_Game_full_ver_No_Game_No_Life_OP_piano_(vmuzice.com).mp3");
    menuMusic.setDataSource(file1.getFileDescriptor(), file1.getStartOffset(), file1.getLength());
    menuMusic.prepare();
    
    AssetFileDescriptor file2=getAssets().openFd("miku_end.mp3");
    gameMusic.setDataSource(file2.getFileDescriptor(), file2.getStartOffset(), file2.getLength());
    gameMusic.prepare();
  }
  catch(IOException e){}
  catch(java.lang.NullPointerException e){}
}