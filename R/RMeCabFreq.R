
RMeCabFreq <- function(filename,  dic = "", mecabrc = "", etc = ""  ){
#   gc()
   if(! file.exists(filename)){
     stop("file not found")
   }


   if( is.null(dic) || is.na(dic)){
     dic = ""
   } else if( (xl <- nchar(dic))  > 0  ) {
     if (substring(dic, xl-3) != ".dic" || !(file.exists(dic)) )
       {
         cat ("specified dictionary file not found; result by default dictionary.\n")
         dic = ""
       }
     else {
       dic <- paste(" -u", dic)
     }
   }	
 
   if(  is.null(mecabrc) || is.na(mecabrc) || (nchar(mecabrc)) < 2  ){
     mecabrc = ""
   } else {
     if ( !(file.exists(mecabrc)) )
       {
         cat ("specified mecabrc not found; result by default mecabrc.\n")
         mecabrc = ""
       }
     else {
       mecabrc <- paste("-r", mecabrc)
     }
   }

   opt <- paste(dic, mecabrc, etc)
   
  .Call("RMeCabFreq", as.character(filename), as.character(opt),  PACKAGE="RMeCabUni" )
}
