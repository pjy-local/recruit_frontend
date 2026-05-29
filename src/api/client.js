const API_BASE = '/api'

async function fetchJson(path) {
  const res = await fetch(`${API_BASE}${path}`)
  if (!res.ok) {
    throw new Error(`API error: ${res.status}`)
  }
  return res.json()
}

export function getFeaturedJobs() {
  return fetchJson('/jobs/featured')
}

export function getHomeStats() {
  return fetchJson('/home/stats')
}
