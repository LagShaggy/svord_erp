<script lang="ts">
	import { page } from '$app/stores'
	import AlertBar from '$src/lib/Alert/AlertBar.svelte'
	import { alertStore } from '$src/lib/Alert/alert'

	$: alertStore.add($page.form?.alert)
</script>

<AlertBar />

<slot />
