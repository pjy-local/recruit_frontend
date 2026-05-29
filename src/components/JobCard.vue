<script setup>
defineProps({
  job: { type: Object, required: true },
})

function formatDate(iso) {
  if (!iso) return ''
  return new Date(iso).toLocaleDateString('ko-KR', { month: 'short', day: 'numeric' })
}

function daysLeft(deadline) {
  if (!deadline) return null
  const end = new Date(deadline)
  const today = new Date()
  today.setHours(0, 0, 0, 0)
  end.setHours(0, 0, 0, 0)
  const diff = Math.ceil((end - today) / (1000 * 60 * 60 * 24))
  return diff > 0 ? `D-${diff}` : '마감'
}
</script>

<template>
  <article class="job-card">
    <div class="job-card__top">
      <span class="job-card__company">{{ job.companyName }}</span>
      <span v-if="daysLeft(job.deadline)" class="job-card__dday">{{ daysLeft(job.deadline) }}</span>
    </div>
    <h3 class="job-card__title">{{ job.title }}</h3>
    <p class="job-card__meta">
      <span>{{ job.department }}</span>
      <span class="dot">·</span>
      <span>{{ job.location }}</span>
    </p>
    <div class="job-card__tags">
      <span class="tag">{{ job.employment }}</span>
      <span v-if="job.experience" class="tag">{{ job.experience }}</span>
      <span v-if="job.salaryRange" class="tag tag--salary">{{ job.salaryRange }}</span>
    </div>
    <p v-if="job.description" class="job-card__desc">{{ job.description }}</p>
    <footer class="job-card__footer">
      <span>{{ job.industry }}</span>
      <time>{{ formatDate(job.postedAt) }} 등록</time>
    </footer>
  </article>
</template>

<style scoped>
.job-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius);
  padding: 24px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  transition: box-shadow 0.2s, border-color 0.2s;
  cursor: pointer;
}

.job-card:hover {
  border-color: var(--color-primary);
  box-shadow: var(--shadow-md);
}

.job-card__top {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.job-card__company {
  font-weight: 600;
  color: var(--color-primary);
  font-size: 14px;
}

.job-card__dday {
  font-size: 12px;
  font-weight: 700;
  color: #e17055;
  background: #fdeee9;
  padding: 2px 8px;
  border-radius: 4px;
}

.job-card__title {
  font-size: 18px;
  font-weight: 700;
}

.job-card__meta {
  font-size: 14px;
  color: var(--color-text-muted);
}

.dot { margin: 0 4px; }

.job-card__tags {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
}

.tag {
  font-size: 12px;
  padding: 4px 10px;
  background: #f0f2f8;
  border-radius: 6px;
  color: var(--color-text-muted);
}

.tag--salary {
  background: #e6f7f1;
  color: #00875a;
}

.job-card__desc {
  font-size: 14px;
  color: var(--color-text-muted);
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.job-card__footer {
  margin-top: auto;
  padding-top: 12px;
  border-top: 1px solid var(--color-border);
  display: flex;
  justify-content: space-between;
  font-size: 12px;
  color: var(--color-text-muted);
}
</style>
