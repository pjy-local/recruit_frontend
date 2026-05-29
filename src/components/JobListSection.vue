<script setup>
import JobCard from './JobCard.vue'

defineProps({
  jobs: { type: Array, default: () => [] },
  loading: { type: Boolean, default: false },
  error: { type: String, default: '' },
})
</script>

<template>
  <section id="jobs" class="jobs">
    <div class="jobs__header">
      <div>
        <h2 class="jobs__title">추천 채용공고</h2>
        <p class="jobs__subtitle">HMM 채용공고를 확인하세요.</p>
      </div>
      <a href="#" class="jobs__more">전체 보기 →</a>
    </div>

    <p v-if="error" class="jobs__error">{{ error }}</p>
    <div v-else-if="loading" class="jobs__grid">
      <div v-for="n in 6" :key="n" class="skeleton" />
    </div>
    <div v-else-if="jobs.length === 0" class="jobs__empty">등록된 추천 공고가 없습니다.</div>
    <div v-else class="jobs__grid">
      <JobCard v-for="job in jobs" :key="job.id" :job="job" />
    </div>
  </section>
</template>

<style scoped>
.jobs {
  max-width: 1200px;
  margin: 0 auto;
  padding: 56px 24px 72px;
}

.jobs__header {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  margin-bottom: 32px;
}

.jobs__title {
  font-size: 28px;
  font-weight: 700;
  margin-bottom: 6px;
}

.jobs__subtitle {
  color: var(--color-text-muted);
  font-size: 15px;
}

.jobs__more {
  font-weight: 600;
  color: var(--color-primary);
}

.jobs__grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));
  gap: 20px;
}

.jobs__error {
  padding: 24px;
  background: #fdeee9;
  color: #c0392b;
  border-radius: var(--radius);
  text-align: center;
}

.jobs__empty {
  padding: 48px;
  text-align: center;
  color: var(--color-text-muted);
  background: var(--color-surface);
  border-radius: var(--radius);
  border: 1px dashed var(--color-border);
}

.skeleton {
  height: 220px;
  background: linear-gradient(90deg, #eef0f5 25%, #f8f9fc 50%, #eef0f5 75%);
  background-size: 200% 100%;
  animation: shimmer 1.2s infinite;
  border-radius: var(--radius);
}

@keyframes shimmer {
  0% { background-position: 200% 0; }
  100% { background-position: -200% 0; }
}
</style>
