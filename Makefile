# Digital UNIX 4.0 compilation flags:
CFLAGS=-std=c11 -pthread -g -w $(DEBUGFLAGS)
RTFLAGS=-lrt

# Solaris 2.5 compilation flags:
#CFLAGS=-D_POSIX_C_SOURCE=199506 -D_REENTRANT -Xa -lpthread -g $(DEBUGFLAGS)
#RTFLAGS=-lposix4

SOURCES=alarm.c	alarm_cond.c	alarm_fork.c	alarm_mutex.c	\
	alarm_thread.c	atfork.c	backoff.c	\
	barrier_main.c	cancel.c	cancel_async.c	cancel_cleanup\
	cancel_disable.c cancel_subcontract.c	cond.c	cond_attr.c	\
	crew.c cond_dynamic.c	cond_static.c	flock.c	getlogin.c hello.c \
	inertia.c	lifecycle.c	mutex_attr.c	\
	mutex_dynamic.c	mutex_static.c	once.c	pipe.c	putchar.c	\
	rwlock_main.c	rwlock_try_main.c		\
	sched_attr.c	sched_thread.c	semaphore_signal.c	\
	semaphore_wait.c	server.c	sigev_thread.c	\
	sigwait.c	susp.c	thread.c \
	thread_attr.c	thread_error.c	trylock.c	tsd_destructor.c \
	tsd_once.c	workq_main.c
PROGRAMS=$(SOURCES:.c=)
all:	${PROGRAMS}
alarm_mutex:
	${CC} -o $@ alarm_mutex.c ${CFLAGS} ${RTFLAGS} ${LDFLAGS}
backoff:
	${CC} -o $@ backoff.c ${CFLAGS} ${RTFLAGS} ${LDFLAGS}
sched_attr:
	${CC} -o $@ sched_attr.c ${CFLAGS} ${RTFLAGS} ${LDFLAGS}
sched_thread:
	${CC} -o $@ sched_thread.c ${CFLAGS} ${RTFLAGS} ${LDFLAGS}
semaphore_signal:
	${CC} -o $@ semaphore_signal.c ${CFLAGS} ${RTFLAGS} ${LDFLAGS}
semaphore_wait:
	${CC} -o $@ semaphore_wait.c ${CFLAGS} ${RTFLAGS} ${LDFLAGS}
sigev_thread:
	${CC} -o $@ sigev_thread.c ${CFLAGS} ${RTFLAGS} ${LDFLAGS}
susp:
	${CC} -o $@ susp.c ${CFLAGS} ${RTFLAGS} ${LDFLAGS}
rwlock_main: rwlock.c rwlock.h rwlock_main.c
	${CC} -o $@ rwlock_main.c rwlock.c ${CFLAGS} ${LDFLAGS}
rwlock_try_main: rwlock.h rwlock.c rwlock_try_main.c
	${CC} -o $@ rwlock_try_main.c rwlock.c ${CFLAGS} ${LDFLAGS}
barrier_main: barrier.h barrier.c barrier_main.c
	${CC} -o $@ barrier_main.c barrier.c ${CFLAGS} ${LDFLAGS}
workq_main: workq.h workq.c workq_main.c
	${CC} -o $@ workq_main.c workq.c ${CFLAGS} ${RTFLAGS} ${LDFLAGS}
clean:
	@rm -rf $(PROGRAMS) *.o
recompile:	clean all
