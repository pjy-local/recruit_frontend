<template>
  <footer class="footer">
    <div class="footer__inner">
      <div class="footer__brand">
        <strong>HMM</strong>
        <p>Vue 3 · Spring Boot · PostgreSQL 기반 채용 플랫폼</p>
      </div>
      <p class="footer__copy">© 2026 HMM. All rights reserved.</p>
    </div>
  </footer>
</template>

<style scoped>
.footer {
  background: #1a1f36;
  color: rgba(255, 255, 255, 0.75);
  padding: 40px 24px;
}

.footer__inner {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  align-items: center;
  gap: 16px;
}

.footer__brand strong {
  color: #fff;
  font-size: 18px;
  display: block;
  margin-bottom: 4px;
}

.footer__brand p {
  font-size: 13px;
}

.footer__copy {
  font-size: 13px;
}
</style>
