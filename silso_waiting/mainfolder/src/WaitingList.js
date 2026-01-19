import React, { useState } from 'react';
import { supabase } from './supabaseClient';
import './WaitingList.css';

function WaitingList() {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [status, setStatus] = useState('idle'); // idle, loading, success, error
  const [message, setMessage] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!name.trim()) {
      setStatus('error');
      setMessage('이름을 입력해 주세요.');
      return;
    }

    if (!email) {
      setStatus('error');
      setMessage('이메일 주소를 입력해 주세요.');
      return;
    }

    setStatus('loading');

    try {
      const { error } = await supabase
        .from('waitlist')
        .insert([{
          email: email.toLowerCase().trim(),
          name: name.trim()
        }])
        .select();

      if (error) {
        if (error.code === '23505') {
          setStatus('success');
          setMessage("이미 명단에 등록되어 있으시네요! 실소가 출시되면 소식을 전해드릴게요.");
        } else {
          throw error;
        }
      } else {
        setStatus('success');
        setMessage("완료되었습니다! 대기 명단에 추가되셨습니다.\n실소 출시 시점에 안내 메일 및 베타 설치 링크를 보내드리겠습니다.");
        setName('');
        setEmail('');
      }
    } catch (error) {
      console.error('Error:', error);
      setStatus('error');
      setMessage('문제가 발생했습니다. 다시 시도해 주세요.');
    }
  };

  return (
    <div className="waiting-list-container">
      <div className="content">
        <img src="/silso_logo.jpg" alt="Silso" className="logo" />
        <h1 className="title">실소 (SilSo)</h1>
        <p className="tagline">실패를 숨기지 않아도 되는 곳</p>

        <div className="description">
          <p>실패를 나누고, 다시 일어나는 사람들의 공간 실소
</p>
        </div>

        <form onSubmit={handleSubmit} className="signup-form">
          <div className="form-group">
            <input
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              placeholder="이름을 입력해주세요"
              className="form-input"
              disabled={status === 'loading'}
              required
            />
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="이메일을 입력해주세요"
              className="form-input"
              disabled={status === 'loading'}
              required
            />
            <button
              type="submit"
              className="submit-button"
              disabled={status === 'loading'}
            >
              {status === 'loading' ? '제출하는 중...' : '제출'}
            </button>
          </div>
        </form>

        {message && (
          <div className={`message ${status}`}>
            {message}
          </div>
        )}

        <div className="footer">
          <p className="privacy">당신을 실소(SilSo) 베타 테스트에 초대합니다.</p>
        </div>
      </div>
    </div>
  );
}

export default WaitingList;