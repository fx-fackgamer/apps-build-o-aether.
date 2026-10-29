(() => {
  const starter = `<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  body { font-family: Arial, sans-serif; background: #eef5ff; text-align: center; padding: 28px 12px; }
  .card { max-width: 320px; margin: 20px auto; padding: 24px; background: white; border-radius: 18px; box-shadow: 0 8px 28px #1d4e891c; }
  button { background: #1769e0; color: white; border: 0; border-radius: 10px; padding: 12px 18px; font-size: 16px; }
</style>
</head>
<body>
  <div class="card">
    <h1>আমার প্রথম অ্যাপ</h1>
    <p id="count">বাটনে চাপ দিয়ে পরীক্ষা করো।</p>
    <button onclick="document.getElementById('count').textContent='JavaScript কাজ করছে!'">Click me</button>
  </div>
  <script>console.log('Preview ready');<\/script>
</body>
</html>`;
  const editor = document.getElementById('codeEditor');
  const toast = document.getElementById('toast');
  function notify(message) {
    toast.textContent = message;
    toast.classList.add('show');
    setTimeout(() => toast.classList.remove('show'), 2300);
  }
  try { editor.value = localStorage.getItem('aether_code') || starter; } catch (_) { editor.value = starter; }
  function save() {
    try { localStorage.setItem('aether_code', editor.value); notify('কোড সংরক্ষণ হয়েছে।'); }
    catch (_) { notify('সংরক্ষণ করা যায়নি। Export HTML ব্যবহার করো।'); }
  }
  document.getElementById('saveBtn').addEventListener('click', save);
  document.getElementById('previewBtn').addEventListener('click', () => {
    try { localStorage.setItem('aether_code', editor.value); } catch (_) {}
    location.href = 'preview.html';
  });
  document.getElementById('copyBtn').addEventListener('click', async () => {
    try {
      if (navigator.clipboard && navigator.clipboard.writeText) await navigator.clipboard.writeText(editor.value);
      else { editor.focus(); editor.select(); document.execCommand('copy'); }
      notify('কোড কপি হয়েছে।');
    } catch (_) { editor.focus(); editor.select(); notify('কোড নির্বাচন করা হয়েছে—Copy চাপো।'); }
  });
  document.getElementById('exportBtn').addEventListener('click', () => {
    const blob = new Blob([editor.value], {type:'text/html;charset=utf-8'});
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url; a.download = 'aether-project.html'; a.click();
    URL.revokeObjectURL(url);
    notify('HTML ফাইল Export করা হয়েছে।');
  });
  document.getElementById('buildInfoBtn').addEventListener('click', () => {
    alert("APK build করার নিয়ম:\\n1. কোড Export HTML করো।\\n2. GitHub Repository-তে Android project-এর app/src/main/assets/user-app.html হিসেবে যোগ করতে হবে।\\n3. GitHub Actions-এর Build Android APK workflow চালাও।\\n\\nএই MVP-তে বাটনটি সরাসরি GitHub workflow চালায় না। নিরাপদ one-tap build integration পরবর্তী ধাপে যোগ করতে হবে; APK-তে ব্যক্তিগত GitHub token রাখা নিরাপদ নয়।");
  });
})(); 
