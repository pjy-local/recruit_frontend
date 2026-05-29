<template>
  <section id="guide" class="guide">
    <h2 class="guide__title">지원 가이드</h2>
    <div class="guide__grid">
      <div class="guide__item">
        <span class="guide__step">01</span>
        <h3>회원가입</h3>
        <p>이메일 또는 소셜 계정으로 간편하게 가입하세요.</p>
      </div>
      <div class="guide__item">
        <span class="guide__step">02</span>
        <h3>이력서 작성</h3>
        <p>경력·학력·포트폴리오를 등록해 매칭률을 높이세요.</p>
      </div>
      <div class="guide__item">
        <span class="guide__step">03</span>
        <h3>공고 지원</h3>
        <p>원하는 채용공고를 선택하고 원클릭으로 지원하세요.</p>
      </div>
    </div>
  </section>
</template>

<style scoped>
.guide {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px 72px;
}

.guide__title {
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 28px;
  text-align: center;
}

.guide__grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
}

.guide__item {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius);
  padding: 28px;
  text-align: center;
}

.guide__step {
  display: inline-block;
  font-size: 13px;
  font-weight: 700;
  color: var(--color-primary);
  background: #e8eefb;
  padding: 4px 12px;
  border-radius: 20px;
  margin-bottom: 14px;
}

.guide__item h3 {
  font-size: 18px;
  margin-bottom: 8px;
}

.guide__item p {
  font-size: 14px;
  color: var(--color-text-muted);
}

@media (max-width: 768px) {
  .guide__grid { grid-template-columns: 1fr; }
}
</style>
