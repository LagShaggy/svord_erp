<script lang="ts">
	import { page } from '$app/stores'
	import AlertBar from '$src/lib/Alert/AlertBar.svelte'
	import { alertStore } from '$src/lib/Alert/alert'

	$: alertStore.add($page.form?.alert)
	$: alertStore.add($page.data?.message)
</script>

<AlertBar />
<slot />
