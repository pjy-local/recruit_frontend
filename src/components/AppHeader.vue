<script setup>
defineProps({
  overlay: { type: Boolean, default: false },
})

const navItems = [
  { label: 'Jobs', href: '#jobs' },
  { label: 'Support', href: '#guide' },
  { label: 'My Applications', href: '#' },
  { label: 'HMM', href: '#' },
  { label: 'HOS', href: '#' },
  { label: 'Admin', href: '#' },
]
</script>

<template>
  <header class="header" :class="{ 'header--overlay': overlay }">
    <div class="header__inner">
      <a href="#" class="logo">
        <span class="logo__text">HMM</span>
      </a>
      <nav class="nav">
        <a v-for="item in navItems" :key="item.label" :href="item.href" class="nav__link">
          {{ item.label }}
        </a>
      </nav>
    </div>
  </header>
</template>

<style scoped>
.header {
  position: sticky;
  top: 0;
  z-index: 100;
  background: rgba(255, 255, 255, 0.92);
  backdrop-filter: blur(10px);
  border-bottom: 1px solid var(--color-border);
}

.header--overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  background: transparent;
  backdrop-filter: none;
  border-bottom: none;
}

.header__inner {
  max-width: 100%;
  margin: 0 auto;
  padding: 0 40px;
  height: 72px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.logo__text {
  font-size: 28px;
  font-weight: 800;
  letter-spacing: -0.02em;
  color: var(--color-primary);
}

.header--overlay .logo__text,
.header--overlay .nav__link {
  color: #fff;
}

.nav {
  display: flex;
  gap: 32px;
}

.nav__link {
  font-size: 15px;
  font-weight: 500;
  color: var(--color-text-muted);
  transition: opacity 0.2s;
}

.nav__link:hover {
  opacity: 0.75;
}

@media (max-width: 900px) {
  .nav { display: none; }
  .header__inner { padding: 0 20px; }
}
</style>
