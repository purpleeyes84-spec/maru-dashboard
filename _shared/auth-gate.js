(function () {
  var HASH = '22d24b3bd500d4cd208ffdc01f1dbba5b4e4e189997ef2d17cdf7cf7eae64e32';
  var KEY = 'maru_pages_gate_v1';
  try {
    if (sessionStorage.getItem(KEY) === '1') return;
  } catch (e) {}

  function sha256hex(str) {
    if (window.crypto && crypto.subtle && window.TextEncoder) {
      return crypto.subtle.digest('SHA-256', new TextEncoder().encode(str)).then(function (buf) {
        return Array.from(new Uint8Array(buf)).map(function (b) {
          return ('0' + b.toString(16)).slice(-2);
        }).join('');
      });
    }
    return Promise.reject(new Error('no crypto'));
  }

  var wrap = document.createElement('div');
  wrap.id = 'maru-auth-gate';
  wrap.setAttribute('style',
    'position:fixed;inset:0;z-index:2147483647;background:#0f172a;display:flex;align-items:center;justify-content:center;font-family:sans-serif;');
  wrap.innerHTML =
    '<form id="maru-auth-form" style="background:#fff;padding:28px 24px;border-radius:12px;width:min(92vw,360px);box-shadow:0 12px 40px rgba(0,0,0,.35)">' +
    '<div style="font-size:18px;font-weight:700;color:#1c3558;margin-bottom:8px">MARU 대시보드</div>' +
    '<div style="font-size:14px;color:#475569;margin-bottom:16px">비밀번호를 입력하세요</div>' +
    '<input id="maru-auth-pass" type="password" autocomplete="current-password" inputmode="text" ' +
    'style="width:100%;box-sizing:border-box;padding:12px;font-size:16px;border:1px solid #cbd5e1;border-radius:8px;margin-bottom:10px" />' +
    '<div id="maru-auth-err" style="display:none;color:#b91c1c;font-size:13px;margin-bottom:8px">비밀번호가 올바르지 않습니다</div>' +
    '<button type="submit" style="width:100%;padding:12px;font-size:16px;border:0;border-radius:8px;background:#1c3558;color:#fff;font-weight:600">들어가기</button>' +
    '</form>';

  function lockScroll(on) {
    document.documentElement.style.overflow = on ? 'hidden' : '';
    document.body && (document.body.style.overflow = on ? 'hidden' : '');
  }

  function mount() {
    if (!document.body) {
      document.addEventListener('DOMContentLoaded', mount, { once: true });
      return;
    }
    document.body.appendChild(wrap);
    lockScroll(true);
    var input = document.getElementById('maru-auth-pass');
    var err = document.getElementById('maru-auth-err');
    document.getElementById('maru-auth-form').addEventListener('submit', function (ev) {
      ev.preventDefault();
      var val = (input.value || '').trim();
      sha256hex(val).then(function (h) {
        if (h === HASH) {
          try { sessionStorage.setItem(KEY, '1'); } catch (e) {}
          wrap.remove();
          lockScroll(false);
        } else {
          err.style.display = 'block';
          input.value = '';
          input.focus();
        }
      }).catch(function () { err.style.display = 'block'; input.focus(); });
    });
    setTimeout(function () { input && input.focus(); }, 50);
  }
  mount();
})();