<script lang="ts">
	import { page } from '$app/stores'
	import { alertStore } from '$src/lib/UI/Alert/alert'
	import AlertBar from '$src/lib/UI/Alert/AlertBar.svelte'

	$: alertStore.add($page.form?.alert)
	$: alertStore.add($page.data?.message)
</script>

<AlertBar />
<slot />
