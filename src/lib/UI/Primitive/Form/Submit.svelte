<script lang="ts">
	import Button from '../Button.svelte'
</script>

<Button submit={true} className={'mt-5'}>
	<slot />
</Button>
