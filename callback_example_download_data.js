function downloadData(url, callback) {
    // Giả định tải dữ liệu từ URL
    setTimeout(() => {
      const data = `Dữ liệu từ ${url}`;
      callback(data);
    }, 1000);
  }
  
  function processData(data, callback) {
    // Giả định xử lý dữ liệu
    setTimeout(() => {
      const processedData = `Xử lý dữ liệu: ${data}`;
      callback(processedData);
    }, 1000);
  }
  
  function displayData(data) {
    console.log(data);
  }
  
  downloadData('https://example.com/data', (downloadedData) => {
    processData(downloadedData, (processedData) => {
      displayData(processedData);
    });
  });
  