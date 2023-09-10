// document.getElementById("loadWallet").addEventListener("click", function() {
//     const loadAmount = document.getElementById('loadAmount').value;
//     const walletPasswd = document.getElementById('walletPasswd').value;
//
//     $.ajax({
//         url: "/loadWallet",
//         method: "POST",
//         data: {
//             loadAmount: loadAmount,
//             walletPasswd: walletPasswd
//         },
//         success: function(data) {
//             alert(data);
//             closeModal();
//         },
//         error: function(jqXHR, textStatus, errorThrown) {
//             alert(jqXHR.responseText || errorThrown);
//         }
//     });
// });

// document.getElementById("loadWallet").addEventListener("click", function() {
//     const loadAmount = document.getElementById('loadAmount').value;
//     const walletPasswd = document.getElementById('walletPasswd').value;
//
//     // 서버로 데이터 전송
//     fetch("/loadWallet", {
//         method: "POST",
//         headers: {
//             "Content-Type": "application/x-www-form-urlencoded",
//         },
//         body: `loadAmount=${loadAmount}&walletPasswd=${walletPasswd}`
//     })
//         .then(response => {
//             if (response.ok) {
//                 return response.text();
//             } else {
//                 return response.text().then(text => {
//                     throw new Error(text);
//                 });
//             }
//         })
//         .then(data => {
//             alert(data);
//             closeModal();
//         })
//         .catch(error => {
//             alert(error.message);
//         });
// });