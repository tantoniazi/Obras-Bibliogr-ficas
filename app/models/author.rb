class Author < ApplicationRecord

    before_create do 
        #o sobrenome será igual a última parte do nome e deve ser apresentado em letras maiúsculas;
        #se houver apenas uma parte no nome, ela deve ser apresentada em letras maiúsculas (sem vírgula): se a entrada for “ Guimaraes” , a saída deve ser “ GUIMARAES”;
        
        if self.name.downcase =~ /(filho|filha|neto|neta|sobrinho|sobrinha|junior)/ 
            if self.name.split(' ').length > 2
                name_formated = self.name.split(/([a-z]+\sfilho|[a-z]+\sfilha|[a-z]+\sneto|[a-z]+\sneta|[a-z]+\ssobrinho|[a-z]+\ssobrinha|[a-z]+\sjunior)/i)
                self.name_formated =  "#{name_formated.last.upcase}, #{name_formated.first}"
            else
                name_formated = self.name.split(' ')
                self.name_formated =  "#{name_formated.last.upcase}, #{name_formated.first}" 
            end
        elsif self.name.downcase =~ /(\sda\s|\sde\s|\sdas\s|\sdos\s)/ 
            name_formated = self.name.split(/([a-z]+\sda\s|[a-z]+\sde\s|[a-z]+\sdas\s|[a-z]+\sdos\s)/i)
            self.name_formated =  "#{name_formated.last.upcase}, #{name_formated.first}"
        else
            name_formated = self.name.split(' ')
            self.name_formated = name_formated.length > 1 ?  "#{name_formated.last.upcase}, #{name_formated.first}" :  " #{name_formated.last.upcase}"
        end

        #se a última parte do nome for igual a "FILHO", "FILHA", "NETO", "NETA", "SOBRINHO", "SOBRINHA" ou "JUNIOR" e houver duas ou mais partes antes, a penúltima parte fará parte do sobrenome. Assim: se a entrada for "Joao Silva Neto", a saída deve ser "SILVA NETO, Joao" ; se a entrada for "Joao Neto" , a saída deve ser "NETO, Joao";
        #as partes do nome que não fazem parte do sobrenome devem ser impressas com a inicial maiúscula e com as demais letras minúsculas;
        #"da", "de", "do", "das", "dos" não fazem parte do sobrenome e não iniciam por letra maiúscula.
        
       
       
    end


end
