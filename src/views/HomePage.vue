<script setup>
import { onMounted, ref } from 'vue'
import { getFeaturedJobs, getHomeStats } from '../api/client'
import AppHeader from '../components/AppHeader.vue'
import HeroSection from '../components/HeroSection.vue'
import StatsBar from '../components/StatsBar.vue'
import JobListSection from '../components/JobListSection.vue'
import GuideSection from '../components/GuideSection.vue'
import AppFooter from '../components/AppFooter.vue'

const jobs = ref([])
const stats = ref({
  totalJobs: 0,
  featuredJobs: 0,
  partnerCompanies: 0,
})
const loading = ref(true)
const error = ref('')

async function loadHomeData() {
  loading.value = true
  error.value = ''
  try {
    const [jobsData, statsData] = await Promise.all([
      getFeaturedJobs(),
      getHomeStats(),
    ])
    jobs.value = jobsData
    stats.value = statsData
  } catch (e) {
    error.value =
      '채용 데이터를 불러오지 못했습니다. PostgreSQL과 백엔드(8080)가 실행 중인지 확인해 주세요.'
    console.error(e)
  } finally {
    loading.value = false
  }
}

onMounted(loadHomeData)
</script>

<template>
  <div class="page">
    <div class="hero-wrap">
      <AppHeader overlay />
      <HeroSection />
    </div>
    <main>
      <StatsBar :stats="stats" :loading="loading" />
      <JobListSection :jobs="jobs" :loading="loading" :error="error" />
      <GuideSection />
    </main>
    <AppFooter />
  </div>
</template>

<style scoped>
.page {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.hero-wrap {
  position: relative;
}

main {
  flex: 1;
  background: var(--color-bg);
}
</style>
