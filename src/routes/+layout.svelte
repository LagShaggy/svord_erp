<script lang="ts">
	import { invalidate } from '$app/navigation'
	import { page } from '$app/stores'
	import { alertStore } from '$src/lib/UI/Alert/alert'
	import AlertBar from '$src/lib/UI/Alert/AlertBar.svelte'
	import { onMount } from 'svelte'

	$: alertStore.add($page.form?.alert)
	$: alertStore.add($page.data?.message)

	export let data
	$: ({ session, supabase } = data)

	onMount(() => {
		const { data } = supabase.auth.onAuthStateChange((_, newSession) => {
			if (newSession?.expires_at !== session?.expires_at) {
				invalidate('supabase:auth')
			}
		})

		return () => data.subscription.unsubscribe()
	})
</script>

<AlertBar />
<slot />
