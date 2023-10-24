<script lang="ts">
	import { session } from './authStores'
</script>

<button class="button flex justify-center" on:click={session.logout}> Logout </button>
