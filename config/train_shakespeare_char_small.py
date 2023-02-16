# train a miniature character-level shakespeare model
# good for debugging and playing on macbooks and such

out_dir = 'out-shakespeare-char'
eval_interval = 5 #250 # keep frequent because we'll overfit
eval_iters = 20 #200
log_interval = 1 # 10 # don't print too too often

# we expect to overfit on this small dataset, so only save when val improves
always_save_checkpoint = False #True

wandb_log = False # override via command line if you like
wandb_project = 'shakespeare-char-small'
wandb_run_name = 'mini-gpt'

dataset = 'shakespeare_char'
batch_size = 12 #64
block_size = 128 # 256 # context of up to 256 previous characters

# baby GPT model :)
n_layer = 5 #6
n_head = 5 #6
n_embd = 160 #384
dropout = 0.2 #0.2

learning_rate = 1e-4 # with baby networks can afford to go a bit higher
max_iters = 100 #5000
lr_decay_iters = 100 #5000 # make equal to max_iters usually
min_lr = learning_rate/10 # learning_rate / 10 usually
beta2 = 0.99 # make a bit bigger because number of tokens per iter is small

warmup_iters = 0 #100 # not super necessary potentially

# on macbook also add
device = 'cpu'  # run on cpu only
compile = False # do not torch compile the model
