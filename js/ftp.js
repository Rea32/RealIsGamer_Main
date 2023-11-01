function uploadFile() {
   var fileInput = document.getElementById("fileInput");
   var file = fileInput.files[0];
   var formData = new FormData();
   formData.append("file", file);

   var xhr = new XMLHttpRequest();
   xhr.open("POST", "upload.php", true);
   xhr.onload = function() {
      if (xhr.status === 200) {
         // El archivo se subió correctamente
      } else {
         // Error al subir el archivo
      }
   };
   xhr.send(formData);
}

