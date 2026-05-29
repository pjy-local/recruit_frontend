<script setup>
defineProps({
  stats: {
    type: Object,
    default: () => ({ totalJobs: 0, featuredJobs: 0, partnerCompanies: 0 }),
  },
  loading: { type: Boolean, default: false },
})
</script>

<template>
  <section id="stats" class="stats">
    <div class="stats__inner">
      <div class="stat">
        <span class="stat__value">{{ loading ? '—' : stats.totalJobs }}</span>
        <span class="stat__label">전체 채용공고</span>
      </div>
      <div class="stat">
        <span class="stat__value">{{ loading ? '—' : stats.featuredJobs }}</span>
        <span class="stat__label">추천 공고</span>
      </div>
      <div class="stat">
        <span class="stat__value">{{ loading ? '—' : stats.partnerCompanies }}</span>
        <span class="stat__label">참여 기업</span>
      </div>
    </div>
  </section>
</template>

<style scoped>
.stats {
  background: var(--color-surface);
  border-top: 1px solid var(--color-border);
  border-bottom: 1px solid var(--color-border);
}

.stats__inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 32px 24px;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
  text-align: center;
}

.stat__value {
  display: block;
  font-size: 36px;
  font-weight: 700;
  color: var(--color-primary);
}

.stat__label {
  font-size: 14px;
  color: var(--color-text-muted);
  font-weight: 500;
}
</style>
