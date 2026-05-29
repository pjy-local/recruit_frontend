<script setup>
import { computed, ref } from 'vue'

const heroImage = '/images/hero-ship.png'

const slides = [
  {
    image: heroImage,
    tagline: 'Connect Values Navigate Growth',
    headline: 'HMM에서 함께 성장할 인재를 기다립니다.',
  },
  {
    image: heroImage,
    tagline: 'Global Shipping Leader',
    headline: '세계를 연결하는 HMM과 함께하세요.',
  },
  {
    image: heroImage,
    tagline: 'Your Career at Sea & Shore',
    headline: '해양 물류의 미래를 이끌 인재를 모십니다.',
  },
]

const categories = [
  { label: 'Experienced Officer', labelKo: '경력직 사관', count: 1 },
  { label: 'Experienced Crew', labelKo: '경력직 부원', count: 0 },
  { label: 'Officer Candidate', labelKo: '대졸 초임 사관', count: 2 },
  { label: 'Industry-Academia Scholarship Student', labelKo: '산학 장학생', count: 2 },
]

const currentSlide = ref(0)
const activeSlide = computed(() => slides[currentSlide.value])

function prevSlide() {
  currentSlide.value = (currentSlide.value - 1 + slides.length) % slides.length
}

function nextSlide() {
  currentSlide.value = (currentSlide.value + 1) % slides.length
}
</script>

<template>
  <section class="hero">
    <div
      class="hero__bg"
      :style="{ backgroundImage: `url(${activeSlide.image})` }"
      role="img"
      aria-label="컨테이너선 항공 사진"
    />
    <div class="hero__overlay" />

    <div class="hero__body">
      <div class="hero__content">
        <p class="hero__tagline">{{ activeSlide.tagline }}</p>
        <h1 class="hero__headline">{{ activeSlide.headline }}</h1>
      </div>

      <aside class="hero__sidebar">
        <ul class="sidebar__list">
          <li v-for="cat in categories" :key="cat.label" class="sidebar__item">
            <div class="sidebar__labels">
              <span class="sidebar__label-en">{{ cat.label }}</span>
              <span class="sidebar__label-ko">{{ cat.labelKo }}</span>
            </div>
            <span class="sidebar__count">{{ cat.count }}</span>
          </li>
        </ul>
        <a href="#jobs" class="sidebar__cta">
          <span>채용공고 전체보기</span>
          <span class="sidebar__cta-icon" aria-hidden="true">→</span>
        </a>
      </aside>
    </div>

    <div class="hero__carousel">
      <button type="button" class="carousel__btn" aria-label="이전 슬라이드" @click="prevSlide">‹</button>
      <span class="carousel__indicator">{{ currentSlide + 1 }} / {{ slides.length }}</span>
      <button type="button" class="carousel__btn" aria-label="다음 슬라이드" @click="nextSlide">›</button>
      <div class="carousel__progress">
        <div
          class="carousel__bar"
          :style="{ width: `${((currentSlide + 1) / slides.length) * 100}%` }"
        />
      </div>
    </div>
  </section>
</template>

<style scoped>
.hero {
  position: relative;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  overflow: hidden;
  color: #fff;
}

.hero__bg {
  position: absolute;
  inset: 0;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

.hero__overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(
    90deg,
    rgba(0, 30, 80, 0.45) 0%,
    rgba(0, 40, 100, 0.2) 55%,
    rgba(0, 50, 120, 0.55) 100%
  );
}

.hero__body {
  position: relative;
  z-index: 2;
  flex: 1;
  display: flex;
  align-items: center;
  padding: 120px 40px 100px;
}

.hero__content {
  flex: 1;
  max-width: 720px;
}

.hero__tagline {
  font-size: clamp(16px, 2vw, 22px);
  margin-bottom: 20px;
  opacity: 0.95;
}

.hero__headline {
  font-size: clamp(32px, 4.5vw, 52px);
  font-weight: 700;
  line-height: 1.35;
  text-shadow: 0 2px 20px rgba(0, 0, 0, 0.25);
}

.hero__sidebar {
  width: min(340px, 32vw);
  flex-shrink: 0;
  background: rgba(0, 55, 130, 0.72);
  backdrop-filter: blur(8px);
  display: flex;
  flex-direction: column;
  align-self: stretch;
  margin-left: auto;
}

.sidebar__list {
  list-style: none;
  flex: 1;
  padding: 28px 0;
}

.sidebar__item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 22px 28px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.12);
}

.sidebar__labels {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.sidebar__label-en {
  font-size: 15px;
  font-weight: 600;
}

.sidebar__label-ko {
  font-size: 13px;
  opacity: 0.75;
}

.sidebar__count {
  font-size: 42px;
  font-weight: 700;
}

.sidebar__cta {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 20px 28px;
  background: rgba(0, 35, 90, 0.9);
  color: #fff;
  font-size: 16px;
  font-weight: 600;
}

.sidebar__cta:hover {
  background: rgba(0, 25, 70, 1);
}

.sidebar__cta-icon {
  width: 36px;
  height: 36px;
  border: 2px solid rgba(255, 255, 255, 0.6);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 18px;
}

.hero__carousel {
  position: relative;
  z-index: 2;
  display: flex;
  align-items: center;
  gap: 16px;
  padding: 0 40px 36px;
}

.carousel__btn {
  width: 40px;
  height: 40px;
  background: transparent;
  color: #fff;
  font-size: 28px;
}

.carousel__indicator {
  font-size: 15px;
  font-weight: 500;
}

.carousel__progress {
  flex: 1;
  max-width: 200px;
  height: 3px;
  background: rgba(255, 255, 255, 0.35);
  border-radius: 2px;
  overflow: hidden;
}

.carousel__bar {
  height: 100%;
  background: #fff;
  transition: width 0.4s ease;
}

@media (max-width: 900px) {
  .hero__body {
    flex-direction: column;
    padding: 100px 20px 80px;
    gap: 32px;
  }
  .hero__sidebar {
    width: 100%;
    margin-left: 0;
  }
}
</style>
